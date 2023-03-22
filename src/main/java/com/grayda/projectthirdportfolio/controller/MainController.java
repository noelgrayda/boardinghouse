package com.grayda.projectthirdportfolio.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.grayda.projectthirdportfolio.models.BoarderInfo;
import com.grayda.projectthirdportfolio.models.Gcash;
import com.grayda.projectthirdportfolio.models.LoginUser;
import com.grayda.projectthirdportfolio.models.LoginUserBoarder;
import com.grayda.projectthirdportfolio.models.Rooms;
import com.grayda.projectthirdportfolio.models.Rules;
import com.grayda.projectthirdportfolio.models.User;
import com.grayda.projectthirdportfolio.models.UserBoarder;
import com.grayda.projectthirdportfolio.service.BoarderInfoService;
import com.grayda.projectthirdportfolio.service.GcashService;
import com.grayda.projectthirdportfolio.service.RoomService;
import com.grayda.projectthirdportfolio.service.RulesService;
import com.grayda.projectthirdportfolio.service.UserBoarderService;
import com.grayda.projectthirdportfolio.service.UserService;

@SpringBootApplication
@ImportResource("classpath:applicationContext.xml")
@Controller
public class MainController {
	
	// FOR EMAIL SENDING FEATURE //
	@Autowired
    JavaMailSender mailSender;
	
	@Autowired
	UserService userService;
	
	@Autowired
	UserBoarderService userBoarderService;
	
	@Autowired
	RoomService roomService;
	
	@Autowired
	BoarderInfoService boarderInfoService;
	
	@Autowired
	GcashService gcashService;
	
	@Autowired
	RulesService rulesService;
	
	@GetMapping("/")
	public String index() {
		return "index.jsp";
	}
	
	@GetMapping("/login")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		
		return "login.jsp";
	}
	
	@PostMapping("/register")
	public String reg(@Valid@ModelAttribute("newUser") User newUser,
			BindingResult result, 
			HttpSession session, 
			Model model) {
		
		User user = userService.register(newUser, result);
		
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "login.jsp";
		}		
		session.setAttribute("userId", user.getId());
		return "redirect:/dashboard";		
	}
	
	@PostMapping("/login")
	public String log(@Valid@ModelAttribute("newLogin") LoginUser newLogin,
			BindingResult result, 
			HttpSession session, 
			Model model) {
		
		User user = userService.login(newLogin, result);
		
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "login.jsp";
		}		
		session.setAttribute("userId", user.getId());
		return "redirect:/dashboard";	
	}
	
	@GetMapping("/dashboard")
	public String dashboard(Model model,
			HttpSession session) {
		
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}	
		
		Long id = (Long) session.getAttribute("userId");
		User user = userService.s_findUserId(id);

		model.addAttribute("user", user);

		return "dashboard.jsp";
	}
	
	@GetMapping("/rooms")
	public String rooms(@ModelAttribute("addroom") Rooms addroom,
			Model model,
			HttpSession session) {
		
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}	
		
		Long id = (Long) session.getAttribute("userId");
		User user = userService.s_findUserId(id);

		model.addAttribute("user", user);
		model.addAttribute("allrooms", roomService.s_findAllRooms());
		return "rooms.jsp";
	}
	
	@PostMapping("/addroom")
	public String addroom(@Valid@ModelAttribute("addroom") Rooms addroom,
			BindingResult result,
			Model model,
			HttpSession session) {
		Long id = (Long) session.getAttribute("userId");
		User user = userService.s_findUserId(id);
		
		if(result.hasErrors()) {
			model.addAttribute("user", user);
			model.addAttribute("allrooms", roomService.s_findAllRooms());
			return "rooms.jsp";
		}
		roomService.s_addRoom(addroom);
		return "redirect:/rooms";
	}
	
	@PostMapping("/roomInfo/{id}")
	public String roomInfo(@PathVariable("id") Long id,
			@Valid@ModelAttribute("board") Rooms board,
			BindingResult result) {
		roomService.s_addRoom(board);
		return "redirect:/rooms/" + id;
	}
	
	@GetMapping("/editRoom/{id}")
	public String editRoom(@PathVariable("id") Long id,
			@ModelAttribute("editRoom") Rooms editRoom,
			Model model,
			HttpSession session) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}	
		
		Long id2 = (Long) session.getAttribute("userId");
		User user = userService.s_findUserId(id2);

		model.addAttribute("user", user);
		model.addAttribute("editRoom", roomService.s_findRoomById(id));
		return "editRoom.jsp";
	}
	
	@PostMapping("/editRoom/{id}")
	public String editRoom(@PathVariable("id") Long id,
			@Valid@ModelAttribute("editRoom") Rooms editRoom,
			BindingResult result,
			Model model) {
		
		if(result.hasErrors()) {
			return "editRoom.jsp";
		}
		model.addAttribute("editRoom", roomService.s_findRoomById(id));
		roomService.s_addRoom(editRoom);
		return "redirect:/rooms";
	}
	
	@GetMapping("/deleteRoom/{id}")
	public String deleteRoom(@PathVariable("id") Long id) {
		roomService.s_deleteRoom(id);
		return "redirect:/rooms";
	}
	
	@GetMapping("/boarders")
	public String boarders(@ModelAttribute("amount") BoarderInfo amount,
			@ModelAttribute("rule") Rules rule,
			HttpSession session,
			Model model) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}	
		
		Long id2 = (Long) session.getAttribute("userId");
		User user = userService.s_findUserId(id2);

		model.addAttribute("user", user);
		model.addAttribute("boarders", boarderInfoService.s_findAllBoarderInfo());
		model.addAttribute("rules", rulesService.s_findAllRules());
		return "boarders.jsp";
	}
	
	@PostMapping("/addAmount/{id}")
	public String addAmount(@PathVariable("id") Long id,
			@Valid@ModelAttribute("amount") BoarderInfo amount,
			BindingResult result) {
		if(result.hasErrors()) {
			return "boarders.jsp";
		}
		boarderInfoService.s_addBoarderInfo(amount);
		return "redirect:/boarders";
	}
	
	@GetMapping("/deleteBoarder/{id}")
	public String deleteBoarder(@PathVariable("id") Long id) {
		userBoarderService.s_deleteBoarder(id);
		boarderInfoService.s_deleteBoarderInfo(id);
		return "redirect:/boarders";
	}
	
	@PostMapping("/addRules")
	public String addRules(@Valid@ModelAttribute("rule") Rules rule,
			BindingResult result,
			Model model) {
		if(result.hasErrors()) {
			return "boarders.jsp";			
		}
		rulesService.s_addRules(rule);
		
		return "redirect:/boarders";
	}
	
	@GetMapping("/removeRules/{id}")
	public String removeRules(@PathVariable("id") Long id) {
		rulesService.s_deleteRules(id);
		return "redirect:/boarders";
	}
	
//===================================================================	
//===================================================================	
//===================================================================	
	@GetMapping("/logBoarder")
	public String logBoarder(Model model) {
		model.addAttribute("newUser", new UserBoarder());
		model.addAttribute("newLogin", new LoginUserBoarder());
		return "loginBoarder.jsp";
	}
	
	@PostMapping("/registerBoarder")
	public String regBoarder(@Valid@ModelAttribute("newUser") UserBoarder newUser,
			BindingResult result, 
			HttpSession session, 
			Model model) {
		
		UserBoarder user = userBoarderService.register(newUser, result);
		
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUserBoarder());
			return "loginBoarder.jsp";
		}		
		session.setAttribute("userBoarderId", user.getId());
		return "redirect:/dashboardBoarder";		
	}
	
	@PostMapping("/loginBoarder")
	public String logBoarder(@Valid@ModelAttribute("newLogin") LoginUserBoarder newLogin,
			BindingResult result, 
			HttpSession session, 
			Model model) {
		
		UserBoarder user = userBoarderService.login(newLogin, result);
		
		if(result.hasErrors()) {
			model.addAttribute("newUser", new UserBoarder());
			return "loginBoarder.jsp";
		}		
		session.setAttribute("userBoarderId", user.getId());
		return "redirect:/dashboardBoarder";	
	}
	
	@GetMapping("/dashboardBoarder")
	public String dashboardBoarder(HttpSession session,
			Model model,
			@ModelAttribute("gcashInput") Gcash gcashInput,
			@ModelAttribute("boarderInfo") BoarderInfo boarderInfo,
			@ModelAttribute("gcashPayment") BoarderInfo gcashPayment) {
		if(session.getAttribute("userBoarderId")==null) {
			return "redirect:/";
		}	
		
		Long id = (Long) session.getAttribute("userBoarderId");
		UserBoarder user = userBoarderService.s_findUserBoarderId(id);

		model.addAttribute("user", user);
		model.addAttribute("rules", rulesService.s_findAllRules());
		model.addAttribute("boarders", boarderInfoService.s_findBoarderInfoById(id));
		model.addAttribute("gcashNum", gcashService.s_findGcashById(id));
		return "dashboardBoarder.jsp";
	}
	
	@PostMapping("/gcash")
	public String profile(@Valid@ModelAttribute("gcashInput") Gcash gcashInput,
			BindingResult result,
			HttpSession session,
			Model model) {
		if(result.hasErrors()) {
			return "dashboardBoarder.jsp";
		}
		gcashService.s_addGcash(gcashInput);
		return "redirect:/dashboardBoarder";
	}
	
	@PostMapping("payGcash/{id}")
	public String payGcash(@PathVariable("id") Long id,
			@Valid@ModelAttribute("gcashPayment") BoarderInfo gcashPayment,
			BindingResult result,
			HttpServletRequest request,
			HttpSession session) {
		
		Long id2 = (Long) session.getAttribute("userBoarderId");
		UserBoarder user = userBoarderService.s_findUserBoarderId(id2);
		BoarderInfo boarder = boarderInfoService.s_findBoarderInfoById(id);
		
		if(result.hasErrors()) {
			return "dashboardBoarder.jsp";
		}
		
		// =========== FOR GCASH SEND EMAIL NOTIFICATION =============== //
		String toEmail = "noelgrayda@gmail.com";
		String subject = "Gcash Rent Payment - " + boarder.getfName() + " " + boarder.getlName();
		String fullName = boarder.getfName() + " " + boarder.getlName();
		String gcashBoarderEmail = user.getEmail();
		String gcashAmount = request.getParameter("gcashAmount");
		String allMessage = fullName + " has paid the total amount of " + gcashAmount + "Php of rent this month.";
		
		SimpleMailMessage message = new SimpleMailMessage();

		message.setTo(toEmail);
		message.setFrom(gcashBoarderEmail);
		message.setSubject(subject);
        message.setText(allMessage);
        
        mailSender.send(message);
		// =========== FOR GCASH SEND EMAIL NOTIFICATION =============== //
        
		boarderInfoService.s_addBoarderInfo(gcashPayment);		
		return "redirect:/dashboardBoarder";
	}
	
	@GetMapping("/removeGcash/{id}")
	public String removeGcash(@PathVariable("id") Long id) {
		gcashService.s_deleteGcash(id);
		return "redirect:/dashboardBoarder";
	}
	
	@PostMapping("dashboardBoarder")
	public String dashboardBoarder(HttpSession session,
			Model model,
			@Valid@ModelAttribute("boarderInfo") BoarderInfo boarderInfo,
			BindingResult result) {
		if(result.hasErrors()) {
			return "dashboardBoarder.jsp";
		}
		boarderInfoService.s_addBoarderInfo(boarderInfo);
		return "redirect:/dashboardBoarder";
	}
	
	@GetMapping("/dashboardBoarder/{id}")
	public String editBoarderInfo(@ModelAttribute("boarderEdit") BoarderInfo boarderEdit,
			Model model,
			HttpSession session) {
		Long id = (Long) session.getAttribute("userBoarderId");
		UserBoarder user = userBoarderService.s_findUserBoarderId(id);
		
		model.addAttribute("user", user);
		model.addAttribute("boarder", boarderInfoService.s_findBoarderInfoById(id));
		model.addAttribute("listRoom", roomService.s_findAllRooms());
		return "editBoarderInfo.jsp";
	}
	
	@PostMapping("/dashboardBoarder/{id}")
	public String addBoarderRoom(@PathVariable("id") Long id,
			@Valid@ModelAttribute("boarderEdit") BoarderInfo boarderEdit,
			BindingResult result,
			Model model) {		
		
		if(result.hasErrors()) {
			model.addAttribute("boarder", boarderInfoService.s_findBoarderInfoById(id));
			model.addAttribute("listRoom", roomService.s_findAllRooms());
			return "editBoarderInfo.jsp";
		}
		boarderInfoService.s_addBoarderInfo(boarderEdit);
		return "redirect:/dashboardBoarder";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
// ================ FOR EMAIL SENDING FEATURE ================================ //
	@PostMapping("/sendEmail")
    public String sendEmail(HttpServletRequest request) {

        String toEmail = request.getParameter("toEmail");
        String potentialRenter = request.getParameter("potentialRenter");
        String fromEmail = request.getParameter("fromEmail");
        String subject = request.getParameter("subject");
        String messageBody = request.getParameter("messageBody");
        String allMessage = "Message from " + potentialRenter + "\n\n" + messageBody + " \n\n--from " + fromEmail;

        SimpleMailMessage message = new SimpleMailMessage();

        message.setTo(toEmail);
        message.setFrom(potentialRenter);
        message.setSubject(subject);
        message.setText(allMessage);

        mailSender.send(message);

        return "redirect:/";
    }
}
