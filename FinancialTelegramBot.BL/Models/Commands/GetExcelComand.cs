using FinancialTelegramBot.BL.Models;
using FinancialTelegramBot.BL;
using Telegram.Bot.Types;
using Telegram.Bot;
using ClosedXML.Excel;
using FinancialTelegramBot.DL.Models;

namespace FinancialTelegramBot.BL.Models.Commands
{
    public class GetExcelComand : BuisnessLogicCommand, ICommand
    {
        public GetExcelComand(Bot bot, DataBaseConnector dataBaseConnector) : base(bot, dataBaseConnector)
        {
        }

        public override List<string> Name => new List<string> { "/excel", "Получить Эксель" };


        public override async Task Execute(Update update)
        {
            long chatId = update.Message.Chat.Id;

            var filePath = @"/root/" + chatId + ".xlsx";

            var user = await DataBaseConnector.UserService.GetUserByTgIdAsync(chatId.ToString());
            if (user == null)
            {
                user = await DataBaseConnector.UserService.CreateUserAsync(new DL.Models.User()
                {
                    TgId = chatId.ToString(),
                    Username = update.Message.Chat.Username,
                    Name = update.Message.Chat.FirstName,
                    Lastname = update.Message.Chat.LastName,
                    CreatedOn = DateTime.Now
                });
            }
            List<Transaction> transactions = await DataBaseConnector.TransactionService.GetAllTransactionsByUserIdAsync((int)user.Id);
            using (var workbook = System.IO.File.Exists(filePath) ? new XLWorkbook(filePath) : new XLWorkbook())
            {
                var worksheet = workbook.Worksheets.Count > 0 ? workbook.Worksheet(1) : workbook.AddWorksheet("Sheet1");

                if (worksheet.Row(1).Cell(1).IsEmpty())
                {
                    worksheet.Cell(1, 1).Value = "Date";
                    worksheet.Cell(1, 2).Value = "Amount";
                    worksheet.Cell(1, 3).Value = "Category";
                    worksheet.Cell(1, 4).Value = "Account";
                    worksheet.Cell(1, 5).Value = "Currency";
                }
                foreach (var transaction in transactions)
                {
                    var nextRow = worksheet.LastRowUsed().RowNumber() + 1;

                    worksheet.Cell(nextRow, 1).Value = transaction.CreatedOn;
                    worksheet.Cell(nextRow, 2).Value = transaction.Amount;
                    if (transaction.CategoryId != null && transaction.CategoryId != 0)
                    {
                        transaction.Category = await DataBaseConnector.CategoryService.GetCategoryByIdAsync((int)transaction.CategoryId);
                        worksheet.Cell(nextRow, 3).Value = transaction.Category.Name;
                    }
                    if (transaction.AccountId != null && transaction.AccountId != 0)
                    {
                        transaction.Account = await DataBaseConnector.AccountService.GetAccountByIdAsync((int)transaction.AccountId);
                        worksheet.Cell(nextRow, 4).Value = transaction.Account.Name;
                        if (transaction.Account.Currency != null && transaction.Account.Currency != 0)
                        {
                            transaction.Account.CurrencyInfo = await DataBaseConnector.CurrencyService.GetCurrencyByIdAsync((int)transaction.Account.Currency);

                            worksheet.Cell(nextRow, 5).Value = transaction.Account.CurrencyInfo.Name;
                        }
                    }

                }
                workbook.SaveAs(filePath);
            }
            using (var stream = System.IO.File.OpenRead(filePath))
            {
                InputFile iof = new InputFileStream(stream, "finance.xlsx");
                var send = await Client.SendDocumentAsync(chatId, iof);
            }
            System.IO.File.Delete(filePath);
        }

    }
}

