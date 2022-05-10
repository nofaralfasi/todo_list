module TasksHelper
  def task_status(task)
    task.status ? 'Done' : 'To Do'
  end

  def task_label(task)
    task.label&.title || 'None'
  end
end
