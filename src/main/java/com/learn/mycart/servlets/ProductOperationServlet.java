package com.learn.mycart.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Product;
import com.learn.mycart.helper.FactoryProvider;


@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ProductOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try(PrintWriter out = response.getWriter()){
			
			
			String op = request.getParameter("operation");
			
			if(op.trim().equals("addcategory"))
			{
				
				//add category
				// fetch category data
				
				String title = request.getParameter("catTitle");
				String description = request.getParameter("catDescription");
				 
				Category category = new Category();
				category.setCategoryTitle(title);
				category.setCategoryDescription(description);
				
				//category database save
				
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
				int catId = categoryDao.saveCategory(category);
				
				
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Category added successfully : "+catId);
				response.sendRedirect("admin.jsp");
				return;
				
				
				
				
			}else if(op.trim().equals("addproduct"))
			{
				
				//add product
				
				String pName=request.getParameter("pname");
				String pDesc = request.getParameter("pdesc");
				int pPrice = Integer.parseInt( request.getParameter("pprice"));
				int pDiscount = Integer.parseInt(request.getParameter("pdiscount"));
				int pQuantity = Integer.parseInt(request.getParameter("pquantity"));
				int pCatId=Integer.parseInt(request.getParameter("pcatId"));
				
				Part part= request.getPart("ppic");
				
				
				Product p= new Product();
				p.setpName(pName);
				p.setpDesc(pDesc);
				p.setpPrice(pPrice);
				p.setpDiscount(pDiscount);
				p.setpQuantity(pQuantity);
				p.setpPhoto(part.getSubmittedFileName());
				
				
				// get category by id
				CategoryDao cdoa= new CategoryDao(FactoryProvider.getFactory());
				Category category = cdoa.getCategoryById(pCatId);
				
				p.setCategory(category);
				
				
				
				// product save...
				
				ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
				pdao.saveProduct(p);
				
				//pic upload
				//find out the path to upload photo
				
				String path = request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
				System.out.println(path);
				
				//uploading code...
				
				try {
					
					
					
				
				
				FileOutputStream fos = new FileOutputStream(path);
				InputStream is = part.getInputStream();
				
				//reading data
				
				byte [] data = new byte[is.available()];
				
				is.read(data);
				
				//writing the data
				fos.write(data);
				
				fos.close();
				
				}catch (Exception e) {
					e.printStackTrace();
				}
				
				
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Product is added successfully : ");
				response.sendRedirect("admin.jsp");
				return;
				
				
			}
			
			
			
			
			
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		doGet(request, response);
	}

}
