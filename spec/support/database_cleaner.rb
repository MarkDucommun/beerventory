RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each, :js) do
    DatabaseCleaner.strategy = :truncation, { except: ROLE_TABLES }
  end

  config.before(:each, :truncate) do
    DatabaseCleaner.strategy = :truncation, { except: ROLE_TABLES }
  end

  config.after(:each, :js) do
    DatabaseCleaner.strategy = :transaction
  end

  config.after(:each, :truncate) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
