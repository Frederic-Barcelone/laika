class XdsPlan < TestPlan
  serialize :test_type_data, ::XDS::Metadata
  validates_presence_of :test_type_data

  # Return a list of XDS metadata objects corresponding to the current patient identifier
  def fetch_xds_metadata
    XDSUtils.list_document_metadata patient.patient_identifier
  end

  # Accepts metadata as a string or hash.
  def test_type_data=(raw_metadata)
    if raw_metadata.instance_of? XDS::Metadata
      super
    elsif raw_metadata.kind_of?(String)
      super YAML.load(raw_metadata)         
    else
      raw_metadata[:source_patient_info] = patient.source_patient_info
      md = XDS::Metadata.new
      md.from_hash(raw_metadata, AFFINITY_DOMAIN_CONFIG)
      md.repository_unique_id = Setting.xds_repository_unique_id
      md.patient_id = patient.patient_identifier
      super md
    end
  end
end

