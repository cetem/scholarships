module StudentsHelper
  def student_kind_selector(form)
    collection = Student::KINDS.map do |k, v|
      [t("view.students.#{v}"), k]
    end

    form.input :kind, collection: collection, prompt: false, 
      input_html: { class: 'span8' }
  end

  def translate_student_kind(kind)
    value = Student::KINDS[kind]
    t("view.students.#{value}")
  end
end
