using FinancialTelegramBot.BL;
using Telegram.Bot.Types;

namespace FinancialTelegramBot.BL.Models.Commands
{
    public abstract class BuisnessLogicCommand : Command
    {
        protected DataBaseConnector DataBaseConnector { get; set; }
        protected BuisnessLogicCommand(Bot bot, DataBaseConnector dataBaseConnector) : base(bot)
        {
            this.DataBaseConnector = dataBaseConnector;
        }

        public BuisnessLogicCommand(Bot bot) : base(bot)
        {
        }
    }
}