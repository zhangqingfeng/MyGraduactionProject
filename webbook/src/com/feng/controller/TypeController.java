package com.feng.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.feng.entity.Type;
import com.feng.service.TypeService;

@Controller
@RequestMapping("/admin")
public class TypeController {
	@Inject
	private TypeService typeService;
	
	@RequestMapping("/type")
	public String type(Model model){
		List<Type> list = typeService.findAll();
		model.addAttribute("list", list);
		return "/admin/type";
	}
	@RequestMapping(value="/type/new",method=RequestMethod.GET)
	public String typenew(){
		return "/admin/newtype";
	}
	@RequestMapping(value="/type/new",method=RequestMethod.POST)
	public String newtype(Type type){
		typeService.save(type);
		return "redirect:/admin/type";
	}
	@RequestMapping(value="/type/edit/{id:\\d+}",method=RequestMethod.GET)
	public String editType(@PathVariable Integer id,Model model){
		Type type = typeService.findById(id);
		model.addAttribute("type", type);
		return "admin/edittype";
	}
	@RequestMapping(value="/type/edit",method=RequestMethod.POST)
	public String editType(Type type){
		typeService.update(type);
		return "redirect:/admin/type";
	}
	@RequestMapping(value="/type/delete",method=RequestMethod.POST)
	public String delete(Type type){
		typeService.delete(type);
		return "redirect:/admin/type";
	}
}
