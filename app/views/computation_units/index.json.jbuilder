json.array!(@computation_units) do |computation_unit|
  json.extract! computation_unit, :id, :ram, :CPU_Cores, :CPU_Clock, :storage, :NIC, :online, :name, :location, :added, :updated
  json.url computation_unit_url(computation_unit, format: :json)
end
