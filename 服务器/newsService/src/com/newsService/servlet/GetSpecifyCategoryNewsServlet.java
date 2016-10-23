package com.newsService.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import com.newsService.dao.impl.CommentDaoImpl;
import com.newsService.dao.impl.NewsDaoImpl;
import com.newsService.po.News;
import com.newsService.utils.TextUtility;

/**
 */
public class GetSpecifyCategoryNewsServlet extends HttpServlet
{
	private static final long serialVersionUID = -1255068904857986077L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{

		response.setContentType("text/html;charset=UTF-8");
		String cidStr = request.getParameter("cid");
		String startNidStr = request.getParameter("startnid");
		String countStr = request.getParameter("count");
		int cid = 0;
		int startNid = 0;
		int count = 0;
		cid = TextUtility.String2Int(cidStr);
		startNid = TextUtility.String2Int(startNidStr);
		count = TextUtility.String2Int(countStr);
		JSONObject jObject = new JSONObject();
		try
		{
			NewsDaoImpl newsDAO = new NewsDaoImpl();
			ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
			ArrayList<News> retList = new ArrayList<News>();
			retList = newsDAO.getSpecifyCategoryNews(cid, startNid, count);
			for (News news : retList)
			{
				HashMap<String, Object> map = new HashMap<String, Object>();
				CommentDaoImpl commentDAO = new CommentDaoImpl();
				long commentCount = commentDAO.getSpecifyNewsCommentsCount(news.getNid());
				map.put("nid", news.getNid());
				map.put("title", news.getTitle());
				map.put("imgsrc", news.getImgSrc());
				map.put("digest", news.getDigest());
				map.put("source", news.getSource());
				map.put("ptime", news.getPtime());
				map.put("commentcount",commentCount);
				list.add(map);
			}
			JSONObject jObject2 = new JSONObject();
			jObject2.put("totalnum", retList.size());
			jObject2.put("newslist", list);

			jObject.put("ret", 0);
			jObject.put("msg", "ok");
			jObject.put("data", jObject2);
		} catch (Exception e)
		{
			e.printStackTrace();
			try
			{
				jObject.put("ret", 1);
				jObject.put("msg", e.getMessage());
				jObject.put("data", "");
			} catch (JSONException ex)
			{
				ex.printStackTrace();
			}
		}
		PrintWriter out = response.getWriter();
		out.println(jObject);
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		throw new NotImplementedException();
	}
}
