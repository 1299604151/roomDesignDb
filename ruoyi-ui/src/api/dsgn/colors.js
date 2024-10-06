import request from '@/utils/request'

// 查询色彩列表
export function listColors(query) {
  return request({
    url: '/system/colors/list',
    method: 'get',
    params: query
  })
}

// 查询色彩详细
export function getColors(id) {
  return request({
    url: '/system/colors/' + id,
    method: 'get'
  })
}

// 新增色彩
export function addColors(data) {
  return request({
    url: '/system/colors',
    method: 'post',
    data: data
  })
}

// 修改色彩
export function updateColors(data) {
  return request({
    url: '/system/colors',
    method: 'put',
    data: data
  })
}

// 删除色彩
export function delColors(id) {
  return request({
    url: '/system/colors/' + id,
    method: 'delete'
  })
}
