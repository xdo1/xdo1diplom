
class DisciplineGroups < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "DisciplineGroup"
    c.title = "Дисциплины"
    c.columns = [
        {name: :subject__name, text: "Дисциплина" },
        {name: :elective, text: "Факультатив" },
        {name: :hours_by_plan, text: "Часов по плану" },
        {name: :total_hours_in_semester, text: "Часов в семестре" },
        {name: :number_z_e, text: "Число з/е" },
        {name: :number_s_r, text: "Число с/р" },
        {name: :number_a_r, text: "Число а/р" },
        {name: :lek_hours_total, text: "Всего лек. час." },
        {name: :lek_work_hours_per_week, text: "Рабочих лек. час. в нед." },
        {name: :lek_study_hours_per_week, text: "Всего лек. час. в нед." },
        {name: :lab_hours_total, text: "Всего лаб. час." },
        {name: :lab_work_hours_per_week, text: "Рабочих лаб. час. в нед." },
        {name: :lab_study_hours_per_week, text: "Всего лаб. час. в нед." },
        {name: :sem_hours_total, text: "Всего сем. час." },
        {name: :sem_work_hours_per_week, text: "Рабочих сем. час. в нед." },
        {name: :sem_study_hours_per_week, text: "Всего сем. час. в нед." },
        {name: :ends, text: "Заканчивается" },
        {name: :report_type, text: "Отчетность" },
        {name: :department__numer, text: "Кафедра" }
    ]
    #c.scope = {number_z_e: current_user.id}
  end
end
