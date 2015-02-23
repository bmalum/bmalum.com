class ComputationUnit
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :ram, type: Integer
  field :CPU_Cores, type: Integer
  field :CPU_Clock, type: Float
  field :storage, type: Array, default: ["nil"]
  field :ip, type: String
  field :uplink, type: Integer
  field :downlink, type: Integer
  field :online, type: Mongoid::Boolean
  field :name, type: String
  field :location, type: String
  field :added, type: DateTime
  field :updated, type: DateTime

  def storage_as_string
    storage.join(',')
  end

  def storage_as_string=(string)
    update_attributes(storage: string.split(','))
  end

end
