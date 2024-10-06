import request from '@/utils/request'

// 查询风格列表
export function listStyles(query) {
  return request({
    url: '/system/styles/list',
    method: 'get',
    params: query
  })
}

// 查询风格详细
export function getStyles(id) {
  return request({
    url: '/system/styles/' + id,
    method: 'get'
  })
}

// 新增风格
export function addStyles(data) {
  return request({
    url: '/system/styles',
    method: 'post',
    data: data
  })
}

// 修改风格
export function updateStyles(data) {
  return request({
    url: '/system/styles',
    method: 'put',
    data: data
  })
}

// 删除风格
export function delStyles(id) {
  return request({
    url: '/system/styles/' + id,
    method: 'delete'
  })
}
