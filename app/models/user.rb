# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    has_many :enrolled_courses,
    through: :enrollments,
    source: :course

    has_many :enrollments,
    foreign_key: :enrollment_id,
    class_name: 'Enrollment',
    primary_key: :id
end
