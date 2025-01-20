class Param < ApplicationRecord
    def self.generate_nn(model_name)
        this_param = Param.find_by_name(model_name)
        cc = 0
        if this_param.present? 
            cc = this_param.int_content
            this_param.int_content += 1
            this_param.save
        end
        cc
    end
end
