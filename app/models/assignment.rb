class Assignment < ActiveRecord::Base

  belongs_to :cohort
  has_many :comments, as: :commentable, dependent: :destroy

  state_machine initial: :new do
    state :reviewing
    state :complete
    state :incomplete

    event :review do
      transition :new => :reviewing
    end

    event :accept do
      transition :reviewing => :complete
    end

    event :reject do
      transition :reviewing => :incomplete
    end

  end


end
