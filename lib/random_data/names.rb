module RandomData

  # Methods to create realistic-looking names
  module Names
    
    # Returns a random letter
    
    def initial
      ('A'..'Z').to_a.rand
    end


    @@lastnames = %w( SMITH JOHNSON WILLIAMS JONES BROWN DAVIS MILLER WILSON MOORE TAYLOR ANDERSON THOMAS JACKSON WHITE HARRIS MARTIN THOMPSON GARCIA MARTINEZ 
                      ROBINSON CLARK RODRIGUEZ LEWIS LEE WALKER )

    # Returns a random lastname
    #
    # >> Random.lastname
    #
    # "Harris"

    def lastname
      @@lastnames.rand.capitalize
    end

    @@firstnames = %w(JAMES JOHN ROBERT MICHAEL WILLIAM DAVID RICHARD CHARLES JOSEPH THOMAS CHRISTOPHER DANIEL PAUL MARK DONALD GEORGE KENNETH STEVEN EDWARD BRIAN 
                      RONALD ANTHONY KEVIN JASON MARY PATRICIA LINDA BARBARA ELIZABETH JENNIFER MARIA SUSAN MARGARET DOROTHY LISA NANCY KAREN BETTY HELEN SANDRA 
                      DONNA CAROL RUTH SHARON MICHELLE LAURA SARAH KIMBERLY DEBORAH)

    # Returns a random firstname
    #
    # >> Random.firstname
    # 
    # "Sandra"

    def firstname
      @@firstnames.rand.capitalize
    end

  end
end
