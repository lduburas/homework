1. Execute statements in `install/create_tables.sql`, `install/ex_rates.sql`, `install/inv_debt_with_rates.sql` and  `installinv_debt.sql`
2. Add test data with `data.sql`
3. There are two views created as a result: `invoices_with_debt` and  `inv_debt_rate`.
The first one ignores payments with wrong currency in debt calculation.
The second one uses currency rate from `ex_rates` view to exchange payments currency to invoices and includes into sum.