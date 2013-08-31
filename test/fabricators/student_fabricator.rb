Fabricator(:student) do
  firstname       { Faker::Name.first_name }
  lastname        { Faker::Name.last_name }
  identification  { |attr| [attr['firstname'], attr['lastname']].join('_') + rand(999).to_s }
  kind            { Student::KINDS.keys.sample }
end
