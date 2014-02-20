# Adding a help called turn_to to assist with page transitions.
module PageObject
    def turn_to kls
      kls.new(@browser)
    end
end