package com.feng.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.feng.entity.Publish;
import com.feng.service.PublishService;

@Controller
@RequestMapping("/admin")
public class PublishController {
	@Inject
	private PublishService publishService;
	@RequestMapping("/publish")
	public String publish(Model model){
		List<Publish> list = publishService.findAll();
		model.addAttribute("list", list);
		return "/admin/publish";
	}
	@RequestMapping(value="/publish/new",method=RequestMethod.GET)
	public String typenew(){
		return "/admin/newpublish";
	}
	@RequestMapping(value="/publish/new",method=RequestMethod.POST)
	public String newtype(Publish publish){
		publishService.save(publish);
		return "redirect:/admin/publish";
	}
	@RequestMapping(value="/publish/edit/{id:\\d+}",method=RequestMethod.GET)
	public String editType(@PathVariable Integer id,Model model){
		Publish publish = publishService.findById(id);
		model.addAttribute("publish", publish);
		return "admin/editpublish";
	}
	@RequestMapping(value="/publish/edit",method=RequestMethod.POST)
	public String editType(Publish publish){
		publishService.update(publish);
		return "redirect:/admin/publish";
	}
	@RequestMapping(value="/publish/delete",method=RequestMethod.POST)
	public String delete(Publish publish){
		publishService.delete(publish);
		return "redirect:/admin/publish";
	}
}
