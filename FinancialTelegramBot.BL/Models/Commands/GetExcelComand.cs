using FinancialTelegramBot.BL.Models;
using FinancialTelegramBot.BL;
using Telegram.Bot.Types;
using Telegram.Bot;

namespace FinancialTelegramBot.BL.Models.Commands
{
    public class GetExcelComand : Command, ICommand
    {
        public GetExcelComand(Bot bot) : base(bot)
        {
        }

        public override List<string> Name => new List<string> { "/excel", "Получить Эксель" };


        public override async Task Execute(Update update)
        {
            long chatId = update.Message.Chat.Id;

            var filePath = @"/root/" + chatId + ".xlsx";
            using (var stream = System.IO.File.OpenRead(filePath))
            {
                InputFile iof = new InputFileStream(stream, "finance.xlsx");
                var send = await Client.SendDocumentAsync(chatId, iof);
            }
        }

    }
}

