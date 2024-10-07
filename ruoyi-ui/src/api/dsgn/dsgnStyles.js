import request from '@/utils/request'

// 查询风格列表
export function listDsgnStyles(query) {
  return request({
    url: '/dsgn/dsgnStyles/list',
    method: 'get',
    params: query
  })
}

// 查询风格详细
export function getDsgnStyles(id) {
  return request({
    url: '/dsgn/dsgnStyles/' + id,
    method: 'get'
  })
}

// 新增风格
export function addDsgnStyles(data) {
  return request({
    url: '/dsgn/dsgnStyles',
    method: 'post',
    data: data
  })
}

// 修改风格
export function updateDsgnStyles(data) {
  return request({
    url: '/dsgn/dsgnStyles',
    method: 'put',
    data: data
  })
}

// 删除风格
export function delDsgnStyles(id) {
  return request({
    url: '/dsgn/dsgnStyles/' + id,
    method: 'delete'
  })
}
