package com.stock.dao;

import com.stock.dto.BoardDTO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
    private final String URL = "jdbc:mysql://localhost:3306/stock_game?useSSL=false&serverTimezone=UTC";
    private final String USER = "root";
    private final String PASS = "thsrkfkr123!"; // 

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    }

    // 글 쓰기
    public int write(String title, String content, String userId) {
        String sql = "INSERT INTO board (board_title, board_content, user_id) VALUES (?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setString(3, userId);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    // 글 목록
    public ArrayList<BoardDTO> getList() {
        String sql = "SELECT * FROM board ORDER BY board_id DESC";
        ArrayList<BoardDTO> list = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                BoardDTO board = new BoardDTO();
                board.setBoardId(rs.getInt("board_id"));
                board.setBoardTitle(rs.getString("board_title"));
                board.setBoardContent(rs.getString("board_content"));
                board.setUserId(rs.getString("user_id"));
                board.setRegDate(rs.getTimestamp("reg_date"));
                board.setBoardHit(rs.getInt("board_hit"));
                list.add(board);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 글 상세 및 조회수 증가
    public BoardDTO getBoard(int boardId) {
        String updateSql = "UPDATE board SET board_hit = board_hit + 1 WHERE board_id = ?";
        String selectSql = "SELECT * FROM board WHERE board_id = ?";
        try (Connection conn = getConnection()) {
            try (PreparedStatement pstmt = conn.prepareStatement(updateSql)) {
                pstmt.setInt(1, boardId);
                pstmt.executeUpdate();
            }
            try (PreparedStatement pstmt = conn.prepareStatement(selectSql)) {
                pstmt.setInt(1, boardId);
                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        BoardDTO board = new BoardDTO();
                        board.setBoardId(rs.getInt("board_id"));
                        board.setBoardTitle(rs.getString("board_title"));
                        board.setBoardContent(rs.getString("board_content"));
                        board.setUserId(rs.getString("user_id"));
                        board.setRegDate(rs.getTimestamp("reg_date"));
                        board.setBoardHit(rs.getInt("board_hit"));
                        return board;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 글 삭제
    public int delete(int boardId) {
        String sql = "DELETE FROM board WHERE board_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, boardId);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}