package com.example.servlet;

import com.example.Dao.CategoryDao;
import com.example.Dao.ProductDao;
import com.example.entities.Categories;
import com.example.entities.Customer;
import com.example.entities.Product;
import com.example.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.*;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset-UTF-8");
        try(PrintWriter out = response.getWriter()){

                String op = request.getParameter("operation");
                if (op.trim().equals("addcategory"))
                {
                    //add category
                    String name =request.getParameter("catName");
                    String description =request.getParameter("catDescription");


                    Categories categories = new Categories();
                    categories.setCategoryName(name);
                    categories.setCategoryDescription(description);

                    //save category to database

                  CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());

                 int catId = categoryDao.saveCategory(categories);

                 //out.println("Category saved");

                  HttpSession httpSession = request.getSession();
                  httpSession.setAttribute("message","Category Added Successfully.Category id is :" +catId);
                  response.sendRedirect("admin.jsp");
                  return;

                }
                else if (op.trim().equals("addproduct")) {
                    //add product
                    String pName = request.getParameter("productName");
                    String pDesc = request.getParameter("productDescription");
                    double pPrice = Double.parseDouble((request.getParameter("productPrice")));
                    int pQuantity = Integer.parseInt(request.getParameter("productQuantity"));
                    double pDiscount = Double.parseDouble((request.getParameter("productDiscount")));
                    int catId = Integer.parseInt(request.getParameter("catId"));
                    Part part = request.getPart("pPic");


                    Product p = new Product();
                    p.setProductName(pName);
                    p.setProductDesc(pDesc);
                    p.setProductPrice(pPrice);
                    p.setProductQuantity(pQuantity);
                    p.setProductDiscount(pDiscount);
                    p.setProductPhoto(part.getSubmittedFileName());


                    //Get categories by id

                    CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
                    Categories categories = cDao.getCategoriesById(catId);

                    p.setCategories(categories);

                    //product save

                    ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
                    productDao.saveProduct(p);

                    //pic upload
                    //find out the path to upload photo

                    try{

                    String path = request.getRealPath("images") + File.separator + "products" + File.separator + part.getSubmittedFileName();
                    System.out.println(path);

                    //uploading code
                    FileOutputStream fos = new FileOutputStream(path);

                    InputStream is = part.getInputStream();

                    //reading data

                    byte[] data = new byte[is.available()];
                    is.read(data);

                    //writing data
                    fos.write(data);
                    fos.close();

                }catch(Exception e)
            {
                e.printStackTrace();

            }

                    out.println("Product save successfully...");

                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message","Product Added Successfully...");
                    response.sendRedirect("admin.jsp");
                    return;


                }

            }catch (Exception e){
                e.printStackTrace();
            }
        }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
