module RandomData

  # Methods to create realistic-looking names
  module Names
    
    # Returns a random letter
    
    def initial
      ('A'..'Z').to_a.rand
    end

    @@lastnames = %w(ABEL ANDERSON ANDREWS ANTHONY BAKER BROWN BURROWS CLARK CLARKE CLARKSON DAVIDSON DAVIES DAVIS 
                     DENT EDWARDS GARCIA GRANT HALL HARRIS HARRISON JACKSON JEFFRIES JEFFERSON JOHNSON JONES 
                     KIRBY KIRK LAKE LEE LEWIS MARTIN MARTINEZ MAJOR MILLER MOORE OATES PETERS PETERSON ROBERTSON 
                     ROBINSON RODRIGUEZ SMITH SMYTHE STEVENS TAYLOR THATCHER THOMAS THOMPSON WALKER WASHINGTON WHITE 
                     WILLIAMS WILSON YORKE)
    @@incorporation_types = %w{LLC Inc Inc. Ltd. LP LLP Corp. PLLC}
    @@company_types       = %w{Clothier Publishing Computing Consulting Engineering Industries Marketing Manufacturing}

    # Returns a random company name
    #
    # >> Random.company_name
    #
    # "Harris & Thomas"

    def companyname
      num = rand(5)
      if num == 0
        num = 1
      end
      final = num.times.collect { @@lastnames.rand.capitalize }

      if final.count == 1
        "#{final.first} #{@@company_types.rand}, #{@@incorporation_types.rand}"
      else
        incorporation_type = rand(17) % 2 == 0 ? @@incorporation_types.rand : nil
        company_type = rand(17) % 2 == 0 ? @@company_types.rand : nil
        trailer = company_type.nil? ? "" : " #{company_type}"
        trailer << ", #{incorporation_type}" unless incorporation_type.nil?
        "#{final[0..-1].join(', ')} & #{final.last}#{trailer}"
      end
    end

    alias company_name companyname
    # Returns a random lastname
    #
    # >> Random.lastname
    #
    # "Harris"

    def lastname
      @@lastnames.rand.capitalize
    end
    alias last_name lastname

    @@male_first_names = %w(ADAM ANTHONY ARTHUR BRIAN CHARLES CHRISTOPHER DANIEL DAVID DONALD EDGAR EDWARD EDWIN 
                            GEORGE HAROLD HERBERT HUGH JAMES JASON JOHN JOSEPH KENNETH KEVIN MARCUS MARK MATTHEW 
                            MICHAEL PAUL PHILIP RICHARD ROBERT ROGER RONALD SIMON STEVEN TERRY THOMAS WILLIAM)

    @@female_first_names = %w(ALISON ANN ANNA ANNE BARBARA BETTY BERYL CAROL CHARLOTTE CHERYL DEBORAH DIANA DONNA 
                              DOROTHY ELIZABETH EVE FELICITY FIONA HELEN HELENA JENNIFER JESSICA JUDITH KAREN KIMBERLY 
                              LAURA LINDA LISA LUCY MARGARET MARIA MARY MICHELLE NANCY PATRICIA POLLY ROBYN RUTH SANDRA 
                              SARAH SHARON SUSAN TABITHA URSULA VICTORIA WENDY)

    @@first_names = @@male_first_names + @@female_first_names


    # Returns a random firstname
    #
    # >> Random.firstname
    # 
    # "Sandra"

    def firstname
      @@first_names.rand.capitalize
    end
    alias first_name firstname


    # Returns a random male firstname
    #
    # >> Random.firstname_male
    # 
    # "James"

    def firstname_male
      @@male_first_names.rand.capitalize
    end
    alias first_name_male firstname_male


    # Returns a random female firstname
    #
    # >> Random.firstname_female
    # 
    # "Mary"

    def firstname_female
      @@female_first_names.rand.capitalize
    end
    alias first_name_female firstname_female
    
    # Returns a random full name
    def full_name(options = { :initial => false, :gender => nil })
      "#{first_name} #{last_name}"
    end
  end
end
