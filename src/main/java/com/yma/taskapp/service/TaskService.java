package com.yma.taskapp.service;

import java.util.List;

import com.yma.taskapp.model.Task;

public interface TaskService {

	public List<Task> findAll();
	public void save(Task task);
	public void delete(int id);
	public Task findTask(int id);
}
