select current_account() as account_locator;

select current_organization_name()||'.'||current_account_name() as account_id;
