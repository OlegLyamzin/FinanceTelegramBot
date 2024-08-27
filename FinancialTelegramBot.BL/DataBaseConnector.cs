using DocumentFormat.OpenXml.Office2016.Drawing.ChartDrawing;
using FinancialTelegramBot.DL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinancialTelegramBot.BL
{
    public class DataBaseConnector
    {
        public AccountService AccountService;
        public CategoryService CategoryService;
        public CategoryTypeService CategoryTypeService;
        public CurrencyService CurrencyService;
        public TransactionService TransactionService;
        public UserService UserService;

        public DataBaseConnector(AccountService accountService,
            CategoryService categoryService,
            CategoryTypeService categoryTypeService,
            CurrencyService currencyService,
            TransactionService transactionService,
            UserService userService) 
        {
            AccountService = accountService;
            CategoryService = categoryService;
            CategoryTypeService = categoryTypeService;
            CurrencyService = currencyService;
            TransactionService = transactionService;
            UserService = userService;
            InitDataBase();
        }

        public async Task InitDataBase()
        {
            foreach(int type in Enum.GetValues(typeof(CategoryType)))
            {
                var categoty = await CategoryTypeService.GetCategoryTypeByIdAsync(type);
                if (categoty == null) {
                    await CategoryTypeService.CreateCategoryTypeAsync(new DL.Models.CategoryType
                    {
                        Id = type,
                        Name = Enum.GetName(typeof(CategoryType), type)
                    });
                }
            }
        }
    }

    public enum CategoryType
    {
        Income = 1,Expense = 2,Savings = 3
    }
}
