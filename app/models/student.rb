class Student < ActiveRecord::Base
  has_paper_trail

  KINDS = {
    'c' => 'copies',
    'd' => 'dining',
    's' => 'software',
    't' => 'transport',
    'w' => 'work'
  }.freeze.with_indifferent_access

  validates :firstname, :lastname, :identification, presence: true
  validates :identification, uniqueness: true

  def to_s
    [self.firstname, self.lastname].join(' ')
  end
end
