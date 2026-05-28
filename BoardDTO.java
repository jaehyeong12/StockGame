package com.stock.dto;

import java.sql.Timestamp;

public class BoardDTO {
    private int boardId;
    private String boardTitle;
    private String boardContent;
    private String userId;
    private Timestamp regDate;
    private int boardHit;

    public int getBoardId() { return boardId; }
    public void setBoardId(int boardId) { this.boardId = boardId; }

    public String getBoardTitle() { return boardTitle; }
    public void setBoardTitle(String boardTitle) { this.boardTitle = boardTitle; }

    public String getBoardContent() { return boardContent; }
    public void setBoardContent(String boardContent) { this.boardContent = boardContent; }

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public Timestamp getRegDate() { return regDate; }
    public void setRegDate(Timestamp regDate) { this.regDate = regDate; }

    public int getBoardHit() { return boardHit; }
    public void setBoardHit(int boardHit) { this.boardHit = boardHit; }
}