package main

import (
	"net/http"
	"net/http/httptest"
	"testing"
)

// 200 OK (正常なID)
func TestUserHandler_Success(t *testing.T) {
    req := httptest.NewRequest(http.MethodGet, "/users/1", nil)
    rec := httptest.NewRecorder()

    userHandler(rec, req)

    res := rec.Result()
    if res.StatusCode != http.StatusOK {
        t.Errorf("Expected status %d, got %d", http.StatusOK, res.StatusCode)
    }
}

// 404 Not Found (存在しないID)
func TestUserHandler_NotFound(t *testing.T) {
    req := httptest.NewRequest(http.MethodGet, "/users/99", nil)
    rec := httptest.NewRecorder()

    userHandler(rec, req)

    res := rec.Result()
    if res.StatusCode != http.StatusNotFound {
        t.Errorf("Expected status %d, got %d", http.StatusNotFound, res.StatusCode)
    }
}

// 400 Bad Request (無効なID)
func TestUserHandler_BadRequest(t *testing.T) {
    req := httptest.NewRequest(http.MethodGet, "/users/abc", nil)
    rec := httptest.NewRecorder()

    userHandler(rec, req)

    res := rec.Result()
    if res.StatusCode != http.StatusBadRequest {
        t.Errorf("Expected status %d, got %d", http.StatusBadRequest, res.StatusCode)
    }
}

// 405 Method Not Allowed (POST でリクエスト)
func TestUserHandler_MethodNotAllowed(t *testing.T) {
    req := httptest.NewRequest(http.MethodPost, "/users/1", nil)
    rec := httptest.NewRecorder()

    userHandler(rec, req)

    res := rec.Result()
    if res.StatusCode != http.StatusMethodNotAllowed {
        t.Errorf("Expected status %d, got %d", http.StatusMethodNotAllowed, res.StatusCode)
    }
}
