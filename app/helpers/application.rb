helpers do
  def current_donor
    @current_donor ||= Donor.get(session['donor_id']) if session['donor_id']
  end
end