class Investor < ActiveRecord::Base
  STATUS = ['Angel', 'VC']

  has_many :endorsements
  has_many :endorsed, through: :endorsements

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :status, presence: true, inclusion:STATUS

  def full_name
    "#{first_name} #{last_name}".titleize
  end

  def self.search(search)
    if search
      where("(first_name || last_name) ILIKE ?", "%#{search}%")
    else
      all
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |investor|
        csv << investor.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Investor.create! row.to_hash
    end
  end


end
