class Article < ApplicationRecord
validates :title,presence:true,length:{minimum:6,maximum:100}
validates:description, presence:true, length:{minimum:20,maximum:600}
validates:Author,presence:true,length:{minimum:6,maximum:100}
end
