package com.yma.taskapp.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.yma.taskapp.dao.TaskRepository;
import com.yma.taskapp.model.Task;
import com.yma.taskapp.service.TaskService;

@Service
@Transactional
public class TaskServiceImpl implements TaskService{

	private final TaskRepository taskRepository;

	public TaskServiceImpl(TaskRepository taskRepository) {		
		this.taskRepository = taskRepository;
	}

	@Override
	public List<Task> findAll() {
		List<Task> tasks = new ArrayList<>();
		for(Task task:taskRepository.findAll()){
			tasks.add(task);
		}
		return tasks;
	}

	@Override
	public void save(Task task) {
		taskRepository.save(task);		
	}

	@Override
	public void delete(int id) {
		taskRepository.delete(id);
	}

	@Override
	public Task findTask(int id) {
		return taskRepository.findOne(id);
	}
	
}
