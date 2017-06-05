package com.yma.taskapp.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yma.taskapp.model.Task;
import com.yma.taskapp.service.TaskService;

@Controller
public class TaskController {

	@Autowired
	private TaskService taskService;
	
	@GetMapping("/")
	public String homePage(HttpServletRequest request){
		request.setAttribute("mode", "MODE_HOME");
		return "index";
	}
	
	@GetMapping("/all-tasks")
	public String allTasks(HttpServletRequest request){
		request.setAttribute("mode", "MODE_TASKS");
		request.setAttribute("tasks", taskService.findAll());
		return "index";
	}
	
	@PostMapping("/save-task")
	public String saveTasks(@ModelAttribute Task task, HttpServletRequest request){
		task.setDateCreated(new Date());
		taskService.save(task);
		request.setAttribute("mode", "MODE_TASKS");
		request.setAttribute("tasks", taskService.findAll());			
		return "index";
	}
	
	@GetMapping("/new-task")
	public String newTasks(HttpServletRequest request){
		Task task = new Task();
		task.setId(0);
		task.setFinished(false);
		request.setAttribute("mode", "MODE_NEW");		
		request.setAttribute("tasks", task);
		return "index";
	}
	
	@GetMapping("/update-task")
	public String updateTasks(@RequestParam int id,HttpServletRequest request){
		request.setAttribute("mode", "MODE_UPDATE");
		request.setAttribute("tasks", taskService.findTask(id));
		return "index";
	}
	
	@GetMapping("/delete-task")
	public String deleteTasks(@RequestParam int id, HttpServletRequest request){		
		taskService.delete(id);
		request.setAttribute("mode", "MODE_TASKS");
		request.setAttribute("tasks", taskService.findAll());
		return "index";
	}
	
}
