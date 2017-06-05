package com.yma.taskapp.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.yma.taskapp.model.Task;

public interface TaskRepository extends CrudRepository<Task, Integer>{

	public List<Task> findAllByOrderByIdAsc();
	
}
