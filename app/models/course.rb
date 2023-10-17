# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  prereq_id     :bigint
#  instructor_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
    has_many :enrollments,
    foreign_key: :enrollment_id,
    class_name: 'Enrollment',
    primary_key: :id

    has_many :enrolled_students,
    through: :enrollments,
    source: :student

    belongs_to :instructor,
    foreign_key: :instructor_id,
    class_name: 'User',
    primary_key: :id

    belongs_to :prerequisite,
    foreign_key: :prereq_id,
    class_name: 'Course',
    primary_key: :id,
    optional: true
end
