module Objects

  ## TODO: For test perpouses the number of values is reduced
  class User
    attr_accessor :name, :default_currency, :locale
    def initialize(name, default_currency, locale)
      @name, @default_currency, @locale = name, default_currency, locale
    end
  end

## TODO: For test perpouses the number of values is reduced
  class Currency
    attr_accessor :id, :code, :name
    def initialize(id, code, name)
      @id, @code, @name = id, code, name
    end
  end

## TODO: For test perpouses the number of values is reduced
  class Deal
    attr_accessor :title, :person_name, :org_name, :value, :currency
    def initialize(title, person_name, org_name, value, currency)
      @title, @person_name, @org_name, @value, @currency = title, person_name, org_name, value, currency
    end
  end

## TODO: For test perpouses the number of values is reduced
  class Organization
    attr_accessor :name, :open_deals_count, :people_count
    def initialize(name, open_deals_count, people_count)
      @name, @open_deals_count, @people_count = name, open_deals_count, people_count
    end
  end

## TODO: For test perpouses the number of values is reduced
  class Activity
    attr_accessor :org_name, :person_name, :deal_title, :type
    def initialize(org_name, person_name, deal_title, type)
      @org_name, @person_name, @deal_title, @type = org_name, person_name, deal_title, type
    end
  end
end
