module BigPanda
  module Helper
    def check_mandatory_options(options={}, mandatory_options=[])
      mandatory_options.each do |option|
        if options[option].nil?
          raise ArgumentError.new("option #{option} is mandatory")
        end
      end
      true
    end
  end
end