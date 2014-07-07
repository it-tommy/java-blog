package com.sss.blogger.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

import org.eclipse.jetty.jndi.local.localContextRoot;
import org.hibernate.annotations.Type;


@Entity
public class Item {

	@Id
	@GeneratedValue
	private int id;
	
	@Column( length = 1000)
	private String title;
	
	@Lob
	@Type( type = "org.hibernate.type.StringClobType")
	@Column( length = Integer.MAX_VALUE)
	private String description;

	@Column( name="published_date" )
	private Date publishDate;
	
	@Column( length = 1000)
	private String link;
	
	@ManyToOne
	@JoinColumn( name= "blog_id" )
	private Blog blog;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}
}
