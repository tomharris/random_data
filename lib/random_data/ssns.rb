module RandomData
  module SSN
    def ssn
      area = ('001'..'772').to_a - ('734'..'749').to_a
      area.delete('666')

      group = ('01'..'99').to_a

      serial = ('0001'..'9999').to_a

      [
        area.rand,
        group.rand,
        serial.rand
      ].join('-')
    end
  end
end

