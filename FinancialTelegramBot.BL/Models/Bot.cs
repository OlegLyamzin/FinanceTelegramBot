using FinancialTelegramBot.BL.Models.Commands;
using FinancialTelegramBot.Core;
using Microsoft.Extensions.Options;
using Telegram.Bot;

namespace FinancialTelegramBot.BL.Models
{
    public class Bot
    {
        private TelegramBotClient client;
        private List<Command> commandList;
        private string adminId;

        public IReadOnlyList<Command> Commands { get => commandList.AsReadOnly(); }

        public Bot(IOptions<AppSettings> option)
        {
            Init(option.Value.API_KEY, option.Value.URL);
            adminId = option.Value.ADMINID;
        }

        public TelegramBotClient Get()
        {
            return client;
        }

        public TelegramBotClient Init(string apiKey, string url)
        {
            commandList = new List<Command>();

            client = new TelegramBotClient(apiKey);
            client.SetWebhookAsync(url).Wait();
            return client;
        }

        public bool IsAdmin(string id)
        {
            return id == adminId;
        }

        public string GetMainAdmin()
        {
            return adminId;
        }
    }
}
