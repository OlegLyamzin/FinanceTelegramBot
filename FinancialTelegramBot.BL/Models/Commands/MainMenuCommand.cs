using FinancialTelegramBot.BL;
using Telegram.Bot;
using Telegram.Bot.Types;
using Telegram.Bot.Types.ReplyMarkups;

namespace FinancialTelegramBot.BL.Models.Commands
{
    public class MainMenuCommand : BuisnessLogicCommand, ICommand
    {
        public MainMenuCommand(Bot bot, DataBaseConnector serverConnector) : base(bot, serverConnector)
        {
        }

        public override List<string> Name => new List<string> { "Главное меню  ↩️", "/start" };


        public override async Task Execute(Update update)
        {
            long chatId = update.Message.Chat.Id;
            string username = update.Message.Chat.Username == null ? update.Message.Chat.Id + "_" + update.Message.Chat.FirstName+"_"+update.Message.Chat.LastName : update.Message.Chat.Username;

                await Client.SendTextMessageAsync(Bot.GetMainAdmin(), $" {chatId} - @{update.Message.Chat.Username} - {update.Message.Chat.FirstName} - {update.Message.Chat.LastName} - Попытка нового подключения");
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


            await Client.SendTextMessageAsync(chatId, "Добро пожаловать в бот ваших финансов", replyMarkup: Keyboards.GetMainMenuBoard(Bot.IsAdmin(chatId.ToString())));
        }

    }
}
