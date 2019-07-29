package com.ezen.antpeople.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ezen.antpeople.entity.NoticeEntity;

@Repository("Notice")
public interface NoticeRepository extends JpaRepository<NoticeEntity, Integer>{
}	
