class Task < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
end
