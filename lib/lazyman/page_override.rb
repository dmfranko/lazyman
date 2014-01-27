module PageObject
    def turn_to kls
      kls.new(@browser)
    end
end