class User < ApplicationRecord
    validates:name,{presence:true,uniqueness:true}  
    validates:password,{presence:true}  
    validates:email,{presence:true,uniqueness:true}  

    has_secure_password
end
