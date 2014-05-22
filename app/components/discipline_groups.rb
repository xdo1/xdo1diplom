class DisciplineGroups < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "DisciplineGroup"
    c.title = "Дисциплины"
    c.columns = [
        {name: :subject__name, text: "Дисциплина" },
        {name: :elective, text: "Фак."},
        {name: :weeks_by_plan, text: "Нед. по плану", :width => 70, default_value: 0 },
        {name: :hours_by_plan, text: "Час. по плану", :width => 70, default_value: 0 },
        {name: :number_z_e, text: "Число з/е", :width => 70, default_value: 0 },
        {name: :number_s_r, text: "Число с/р", :width => 70, default_value: 0 },
        {name: :number_a_r, text: "Число а/р", :width => 70, default_value: 0 },
        {name: :lek_work_hours_per_week, text: "Раб.лек.час.в нед.", default_value: 0 },
        {name: :lek_study_hours_per_week, text: "Учеб.лек.час.в нед.", default_value: 0 },
        {name: :lab_work_hours_per_week, text: "Раб.лаб. час. в нед.", default_value: 0 },
        {name: :lab_study_hours_per_week, text: "Учеб.лаб.час.в нед.", default_value: 0 },
        {name: :sem_work_hours_per_week, text: "Раб.сем.час.в нед.", default_value: 0 },
        {name: :sem_study_hours_per_week, text: "Учеб.сем.час.в нед.", default_value: 0 },
        {name: :ends, text: "Заканчивается" },
        {name: :report_type, text: "Отчетность", :width => 80 },
        {name: :department__numer, text: "Кафедра" },
        {name: :group__name, text: "Группа", default_value: session[:group_id], hidden: true}
    ]
    c.scope = {group_id: session[:group_id]}
  end
end
