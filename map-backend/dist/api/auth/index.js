"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var koa_router_1 = __importDefault(require("koa-router"));
var auth_ctrl_1 = __importDefault(require("./auth.ctrl"));
var auth = new koa_router_1.default();
auth.post('/login', auth_ctrl_1.default.login);
auth.post('/register', auth_ctrl_1.default.register);
exports.default = auth;
