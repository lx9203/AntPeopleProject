package com.ezen.antpeople.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ezen.antpeople.entity.BbsEntity;

@Repository
public interface BbsRepository extends JpaRepository<BbsEntity, Integer>{

}
