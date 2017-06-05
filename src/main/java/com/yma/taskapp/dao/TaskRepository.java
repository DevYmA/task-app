package com.yma.taskapp.dao;

import org.springframework.data.repository.CrudRepository;

import com.yma.taskapp.model.Task;

public interface TaskRepository extends CrudRepository<Task, Integer>{

	
}
