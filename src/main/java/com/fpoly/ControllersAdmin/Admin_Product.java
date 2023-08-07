package com.fpoly.ControllersAdmin;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fpoly.Entity.Category;
import com.fpoly.Entity.Product;
import com.fpoly.Entity.ProductDetail;
import com.fpoly.Entity.ProductImg;
import com.fpoly.Repository.CategoryDAO;
import com.fpoly.Repository.ProductDAO;
import com.fpoly.Repository.ProductDetailDAO;
import com.fpoly.Repository.ProductImgDAO;
import com.fpoly.Service.ProductService;
import com.fpoly.Utils.MultipleUpload;

@Controller
@RequestMapping("index/product")
public class Admin_Product {

	@Autowired
	private ProductService service;
	@Autowired
	private CategoryDAO daoCate;

	@Autowired
	ProductDAO Pdao;

	@Autowired
	ProductDetailDAO PDdao;

	@Autowired
	ProductImgDAO Idao;

	@Autowired
	HttpServletRequest request;
	
	@Autowired
	MultipleUpload Upload;

	private Integer idUpdate = null;
	private Integer IdP;
	private Integer IdPD;

	@ModelAttribute("listCategory")
	public List<Category> getCategory() {
		List<Category> listCate = daoCate.findAll();
		return listCate;
	}

	@GetMapping()
	public String viewTable(Model model,@RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 3);
		Page<Product> page = service.findAlls(pageable);
		model.addAttribute("page", page);
		return "Admin/tblSanPham";
	}

	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Product product, Model model) {
		idUpdate = product.getId();

		Product sp = this.service.getByProductId(product.getId());

		model.addAttribute("productDetail", this.service.getProductDetailByID(product.getId()));
		model.addAttribute("product", sp);
		return "Admin/editSanPham";
	}
	
	@PostMapping("/delete")
	public String deleteP( Model model) {

		Product sp = this.service.getByProductId(idUpdate);
		Pdao.delete(sp);
		model.addAttribute("product", sp);
		return "redirect:/index/product";
	}
	

	// them san pham

	@GetMapping("/create-product")
	public String create(Model model) {
		model.addAttribute("product", new Product());
		return "Admin/editSanPham";
	}

	@PostMapping("/save-product")
	public String saveProduct(@ModelAttribute("product") Product product,@RequestParam("upload_File") MultipartFile[] multipleUpload) {
		if (product != null && multipleUpload != null) {
			List<String> list = new ArrayList<>();
			
			 Upload.handleUploadFile(multipleUpload);
			for (String img: list) {
				product.setImgProduct(img);
			}
			
			 Pdao.save(product);
			 IdP = product.getId();

		}
		return "redirect:/index/product/create-color&size";
	}

	@GetMapping("/create-color&size")
	public String viewDetail(Model model) {
		Product pr = Pdao.getReferenceById(IdP);
		model.addAttribute("listProductCreated", pr);
		return "Admin/editSizeAndColor";
	}

	@PostMapping("/save-color&size")
	public String saveProductDetail( @RequestParam("color") String color,
			@RequestParam("size") Integer[] size,
			@RequestParam("upload_File") MultipartFile[] multipleUpload) {
		if (size != null && multipleUpload != null) {

			String colorNew = request.getParameter("colorNew");

			Product pr = Pdao.getReferenceById(IdP);
			
			String colorNew2 = "";

			if (colorNew.equals("")) {
				colorNew2 = color;
			} else {
				colorNew2 = colorNew;
			}

			for (Integer sizes : size) {
				ProductDetail detail = new ProductDetail();
				detail.setColor(colorNew2);
				detail.setSize(String.valueOf(sizes));
				detail.setProduct(pr);
				 PDdao.save(detail);
				IdPD = detail.getId();
				System.out.println(detail.getColor());
			}
			
			List<String> list = new ArrayList<>();
			
			ProductDetail productDetail = PDdao.getReferenceById(IdPD);
			
			 Upload.handleUploadFile(multipleUpload);
			 

			for (MultipartFile multipartFile : multipleUpload) {
				list.add(multipartFile.getOriginalFilename());
			}

			for (String string : list) {
				ProductImg img = new ProductImg();
				img.setImg(string);
				img.setProductDetail(productDetail);
				System.out.println(img.getImg());
				this.Idao.save(img);
			}
			
		}

		return "redirect:/index/product";
	}
	
	
	
	
	

	@ModelAttribute("ListSizeLocal")
	public List<Integer> ListSizeLocal() {
		List<Integer> list = new ArrayList<>();
		for (int i = 19; i <= 45; i++) {
			list.add(i);
		}
		return list;
	}

	@ModelAttribute("ListColorLocal")
	public List<String> MapColor() {
		return PDdao.getColor();
	}
	
	@GetMapping("/search")
	public String search(@RequestParam("search") Optional<String> keyS, Model model,@RequestParam("page") Optional<Integer> page) {
	
		Pageable pageable = PageRequest.of(page.orElse(0), 3);
		Page<Product> pages = Pdao.findAllByNameLike("%"+keyS.orElse("")+"%", pageable);
		model.addAttribute("page", pages);
		return"/Admin/tblSanPham";
	}

}
