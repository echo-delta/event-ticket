class Invoice < ApplicationRecord
	require 'delayed_job'
	after_initialize :set_defaults
	after_create :expire

	belongs_to :user
	has_many :tickets
	has_many :booked_sections
	validates :user_id, presence: true
	validates :event_id, presence: true

  def set_defaults
    self.is_paid  ||= 0
  end

  def expire
  	booked_sections.each do |booked_section|
  		@section = Section.find(booked_section.section_id)
			@section.update(:capacity => @section.capacity + 1)
		end
		update(:is_paid => -1)
  end
  handle_asynchronously :expire, run_at: Proc.new { Time.now + 20.seconds }
  # def set_timer
  #   delay(:run_at => Proc.new { 20.seconds.from_now }).expire
  # end

end
